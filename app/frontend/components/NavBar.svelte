<script lang="ts">
  import { Link, page, inertia } from "@inertiajs/svelte";
</script>

<Link href="/">Home</Link>
<Link href="/about">About</Link>
<Link href="/articles">Articles</Link>
{#if $page.props.auth}
  <p>Signed in as {$page.props.auth.user}</p>
  <button
    use:inertia={{ href: "/users/sign_out", method: "delete" }}
    type="button">Sign out</button
  >
{:else}
  <Link href="/users/sign_in">Sign in</Link>
  <Link href="/users/sign_up">Sign up</Link>
{/if}
