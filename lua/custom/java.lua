-- Java filetype settings and config for work
-- vim.opt_local.shiftwidth = 2

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = 'C:\\work\\workspace\\' .. project_name

local launcher_jar = vim.fn.glob 'C:\\Program Files\\jdt-language-server\\plugins\\org.eclipse.equinox.launcher_*.jar'

local config = {
  cmd = {
    'C:\\Program Files\\Amazon Corretto\\jdk17.0.11_9\\bin\\java',
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xmx1g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens',
    'java.base/java.util=ALL-UNNAMED',
    '--add-opens',
    'java.base/java.lang=ALL-UNNAMED',
    '-javaagent:C:\\Program Files\\jdt-language-server\\plugins\\lombok.jar',
    '-jar',
    launcher_jar,
    '-configuration',
    'C:\\Users\\Jack\\.jdtls\\jdt-language-server\\config_win',
    '-data',
    workspace_dir,
  },
  root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'build.gradle', 'settings.gradle' }, { upward = true })[1]) or vim.fn.getcwd(),
  settings = {
    java = {
      configuration = {
        runtimes = {
          {
            name = 'JavaSE-17',
            path = 'C:\\Program Files\\Amazon Corretto\\jdk17.0.11_9',
          },
        },
      },
    },
  },
}

return function()
  vim.opt_local.shiftwidth = 2
  require('jdtls').start_or_attach(config)
end
