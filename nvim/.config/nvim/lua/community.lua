-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  -- Pacote base de PHP (geralmente instala o Intelephense ou Phpactor dependendo da config)
  { import = "astrocommunity.pack.laravel" },
  -- Suporte para arquivos Blade
  { import = "astrocommunity.pack.blade" },

  -- Opcional: Se quiser garantir o Intelephense especificamente
  -- (embora o pack.php geralmente já cuide disso)
}
