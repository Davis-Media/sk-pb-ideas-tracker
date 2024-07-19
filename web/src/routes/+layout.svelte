<script>
	import { setAuthContext } from '$lib/pocketbase/auth.svelte';
	import '../app.css';

	const auth = setAuthContext();

	const { children } = $props();
</script>

{@render children()}
