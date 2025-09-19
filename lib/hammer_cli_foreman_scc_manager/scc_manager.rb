# frozen_string_literal: true

module HammerCLIForemanSCCManager
  class SCCManagerCommand < HammerCLI::AbstractCommand
    lazy_subcommand(
      %w[scc-accounts scc_accounts],
      _('Manage SCC accounts'),
      'HammerCLIForemanSCCManager::SCCAccountsCommand',
      'hammer_cli_foreman_scc_manager/scc_account'
    )

    autoload_subcommands
  end
end
