import { defineConfig } from 'vite'
import RubyPlugin from 'vite-plugin-ruby'
import { svelte } from '@sveltejs/vite-plugin-svelte'
import FullReload from 'vite-plugin-full-reload'

export default defineConfig({
  plugins: [
    RubyPlugin(),
    svelte(),
    FullReload(['config/routes.rb', 'app/views/**/*'], { delay: 100 }),
  ],
})
