<script>
	import Separator from '$lib/components/ui/separator/separator.svelte';
	import * as Card from '$lib/components/ui/card/index';
	import * as Select from '$lib/components/ui/select';
	import { pb } from '$lib/pocketbase';
	import { getAuthContext } from '$lib/pocketbase/auth.svelte';
	import { Button } from '$lib/components/ui/button';
	import { Label } from '$lib/components/ui/label';
	import { Input } from '$lib/components/ui/input';

	const auth = getAuthContext();

	const ideaTypes = [
		{
			display: 'Video',
			value: 'video'
		},
		{
			display: 'Tweet',
			value: 'tweet'
		},
		{
			display: 'Business',
			value: 'business'
		},
		{
			display: 'Personal',
			value: 'personal'
		},
		{
			display: 'Misc',
			value: 'misc'
		}
	];

	let isLoading = $state(false);

	let nContent = $state('');
	let nType = $state('');

	const saveIdea = async () => {
		isLoading = true;
		await pb.collection('ideas').create({
			idea: nContent,
			type: nType
		});
		alert('Saved idea');
		nContent = '';
		isLoading = false;
	};
</script>

<div class="grid min-h-[100dvh] w-full grid-cols-1 lg:grid-cols-2">
	<div class="bg-muted flex items-center justify-center p-6 lg:p-12">
		<div class="max-w-md space-y-4">
			<h1 class="text-3xl font-bold tracking-tight sm:text-4xl">
				Welcome {auth.user.username}
			</h1>
			<p class="text-muted-foreground">Save your ideas here</p>
			<Button onclick={() => auth.logout()}>Sign Out</Button>
		</div>
	</div>
	<div class="bg-background flex items-center justify-center p-4">
		<Card.Root class="w-full p-4">
			<Card.Header>
				<Card.Title>Save Idea</Card.Title>
				<Separator />
			</Card.Header>
			<div class="flex w-full flex-col items-center gap-4">
				<div class="w-full">
					<Label>Content</Label>
					<Input placeholder="make more money..." bind:value={nContent} />
				</div>
				<div class="w-full">
					<Label>Type</Label>
					<Select.Root
						onSelectedChange={(v) => {
							nType = v.value;
						}}
					>
						<Select.Trigger class="w-full">
							<Select.Value placeholder="Type" />
						</Select.Trigger>
						<Select.Content>
							{#each ideaTypes as type}
								<Select.Item value={type.value}>{type.display}</Select.Item>
							{/each}
						</Select.Content>
					</Select.Root>
				</div>
				<div class="flex w-full flex-row justify-end">
					<Button disabled={isLoading} onclick={saveIdea}>Save</Button>
				</div>
			</div>
		</Card.Root>
	</div>
</div>
