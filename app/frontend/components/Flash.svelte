<script lang="ts">
  import { page } from "@inertiajs/svelte";
</script>

{#if $page.props.has_flash}
  {#if $page.props.flash.hasOwnProperty("alert")}
    <h1 style="color: red;">{$page.props.flash.alert}</h1>
  {:else if $page.props.flash.hasOwnProperty("notice")}
    <h1 style="color: blue;">{$page.props.flash.notice}</h1>
  {/if}
{/if}
