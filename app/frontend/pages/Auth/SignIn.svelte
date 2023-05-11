<script lang="ts">
  import { useForm } from "@inertiajs/svelte";

  let form = useForm({
    user: {
      email: null,
      password: null,
      remember: false,
    },
  });

  function submit() {
    $form.post("/users/sign_in");
  }
</script>

<svelte:head>
  <title>Sign in</title>
</svelte:head>

<form on:submit|preventDefault={submit}>
  <label
    >メールアドレス
    <input type="email" bind:value={$form.user.email} />
  </label>
  <label>
    パスワード
    <input type="password" bind:value={$form.user.password} />
  </label>
  <input type="checkbox" bind:checked={$form.user.remember} /> Remember Me
  <button type="submit" disabled={$form.processing}>Sign in</button>
</form>
