<script lang="ts">
  import { Link, inertia } from "@inertiajs/svelte";
  import New from "./New.svelte";
  import Edit from "./Edit.svelte";
  export let articles;
</script>

<h1>All Articles</h1>

<New />

{#each articles as article}
  <div>
    {#key article.id}
      <Link href="/articles/{article.id}">{article.title}</Link>
      <Edit {article} />
      <button
        use:inertia={{ href: "/articles/" + article.id, method: "delete" }}
        type="button">Delete</button
      >
    {/key}
  </div>
{/each}
