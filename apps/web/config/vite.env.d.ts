/// <reference types="vite/client" />

interface ImportMetaEnv {
  readonly SNEAKYCASH_SERVER_URL: string
}

interface ImportMeta {
  readonly env: ImportMetaEnv
}
