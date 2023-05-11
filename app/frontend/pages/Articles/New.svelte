<script lang="ts">
  import { useForm } from "@inertiajs/svelte";

  let form = useForm({
    title: null,
    body: null,
  });

  function submit() {
    $form.post("/articles");
  }
</script>

<form on:submit|preventDefault={submit}>
  <label
    >タイトル
    <input type="text" bind:value={$form.title} />
  </label>
  {#if $form.errors.title}
    <div>{$form.errors.title}</div>
  {/if}
  <label
    >本文
    <input type="text" bind:value={$form.body} />
  </label>
  {#if $form.errors.body}
    <div>{$form.errors.body}</div>
  {/if}
  <button type="submit" disabled={$form.processing}>Submit</button>
</form>
