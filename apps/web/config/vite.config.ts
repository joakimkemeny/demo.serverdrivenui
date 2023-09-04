import react from "@vitejs/plugin-react"
import { defineConfig } from "vite"

export default defineConfig({
  build: {
    outDir: ".build",
    sourcemap: true,
  },
  envDir: "config",
  envPrefix: "SNEAKYCASH_",
  plugins: [react()],
  publicDir: "assets",
  server: {
    host: true,
    port: 3000,
  },
})
