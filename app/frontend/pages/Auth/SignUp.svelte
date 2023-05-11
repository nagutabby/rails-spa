<script lang="ts">
  import { useForm } from "@inertiajs/svelte";

  let form = useForm({
    user: {
      name: null,
      email: null,
      password: null,
      password_confirmation: null,
    },
  });

  function submit() {
    $form.post("/users/");
  }
</script>

<svelte:head>
  <title>Sign up</title>
</svelte:head>

<form on:submit|preventDefault={submit}>
  <label
    >名前
    <input type="text" bind:value={$form.user.name} />
  </label>
  <label
    >メールアドレス
    <input type="email" bind:value={$form.user.email} />
  </label>
  <label
    >パスワード
    <input type="password" bind:value={$form.user.password} />
  </label>
  <label
    >パスワード(確認用)
    <input type="password" bind:value={$form.user.password_confirmation} />
  </label>
  <button type="submit" disabled={$form.processing}>Sign up</button>
</form>
