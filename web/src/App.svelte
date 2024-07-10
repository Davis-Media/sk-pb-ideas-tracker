<script>
	import './app.css';
	import { setAuthContext } from '$lib/pocketbase/auth.svelte';
	import Core from '$lib/components/Core.svelte';

	const auth = setAuthContext();
</script>

{#if auth.isSynced}
	<Core />
{:else}
	<div>Loading...</div>
{/if}
