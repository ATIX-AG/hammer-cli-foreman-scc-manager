module HammerCLIForemanSCCManager
  require 'hammer_cli'
  require 'hammer_cli_foreman'

  require 'hammer_cli_foreman_scc_manager/version'
  require 'hammer_cli_foreman_scc_manager/i18n'
  require 'hammer_cli_foreman_scc_manager/scc_account'

  HammerCLI::MainCommand.lazy_subcommand(
    'scc_manager',
    'Manage SUSE accounts and product subscriptions',
    'HammerCLIForemanSCCManager::SCCManagerCommand',
    'hammer_cli_foreman_scc_manager/scc_manager'
  )
end
