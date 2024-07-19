<script>
	import Button from '$lib/components/ui/button/button.svelte';
	import { pb } from '$lib/pocketbase';
	import Input from '$lib/components/ui/input/input.svelte';
	import { getAuthContext } from '$lib/pocketbase/auth.svelte';
	import Label from '$lib/components/ui/label/label.svelte';

	const auth = getAuthContext();

	let email = $state('');
	let password = $state('');

	const signInWithEmail = async () => {
		await auth.signInWithEmail(email, password);
	};

	const { children } = $props();
</script>

{#if auth.user}
	{@render children()}
{:else}
	<div class="grid min-h-[100dvh] w-full grid-cols-1 lg:grid-cols-2">
		<div class="bg-muted flex items-center justify-center p-6 lg:p-12">
			<div class="max-w-md space-y-4">
				<h1 class="text-3xl font-bold tracking-tight sm:text-4xl">Personal Ideas System</h1>
				<p class="text-muted-foreground">Not for public use.</p>
			</div>
		</div>
		<div class="bg-background flex items-center justify-center p-6 lg:p-12">
			<div class="w-full max-w-md space-y-4">
				<h2 class="text-2xl font-bold">Login</h2>
				<div class="space-y-4">
					<div>
						<Label for="email">email</Label>
						<Input type="email" name="email" placeholder="john@doe.com" bind:value={email} />
					</div>
					<div>
						<Label for="password">password</Label>
						<Input type="password" name="password" placeholder="*********" bind:value={password} />
					</div>
					<Button class="w-full" onclick={signInWithEmail}>Sign in</Button>
				</div>
			</div>
		</div>
	</div>
{/if}
