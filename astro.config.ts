import sitemap from "@astrojs/sitemap";
import vercel from "@astrojs/vercel/serverless";
import compress from "astro-compress";
import { defineConfig } from "astro/config";
import { VitePWA } from "vite-plugin-pwa";
import { manifest, seoConfig } from "./utils/seoConfig";

// https://astro.build/config
export default defineConfig({
  site: seoConfig.baseURL,
  integrations: [sitemap(), compress()],
  vite: {
    plugins: [VitePWA({
      registerType: "autoUpdate",
      manifest,
      workbox: {
        globDirectory: 'dist',
        globPatterns: ['**/*.{js,css,svg,png,jpg,jpeg,gif,webp,woff,woff2,ttf,eot,ico}'],
        // Don't fallback on document based (e.g. `/some-page`) requests
        // This removes an errant console.log message from showing up.
        navigateFallback: null
      }
    }) as any]
  },
  output: "server",
  adapter: vercel()
});