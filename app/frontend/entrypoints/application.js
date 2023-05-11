import { createInertiaApp } from "@inertiajs/svelte"
import Layout from "../layouts/Layout.svelte"

const pages = import.meta.glob("../pages/**/*.svelte")

createInertiaApp({
  resolve: async name => {
    const page = await pages[`../pages/${name}.svelte`]()
    return Object.assign({ layout: Layout }, page)
  },
  setup({ el, App, props }) {
    new App({ target: el, props })
  },
})
