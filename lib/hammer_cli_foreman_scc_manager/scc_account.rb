# frozen_string_literal: true

module HammerCLIForemanSCCManager
  class SCCAccountsCommand < HammerCLIForeman::Command
    resource :scc_accounts

    # include scc products as sub command of scc account
    lazy_subcommand(
      'scc_products',
      'Subcommands for SCC products',
      'HammerCLIForemanSCCManager::SCCProductsCommand',
      'hammer_cli_foreman_scc_manager/scc_product'
    )

    class ListCommand < HammerCLIForeman::ListCommand
      output do
        field :name, _('SCC account name')
        field :id, _('SCC account id')
        field :organization_name, _('Organization name')
        field :base_url, _('Base URL')
        field :interval, _('Sync interval')
        field :sync_date, _('Sync date')
      end
      build_options
    end

    class InfoCommand < HammerCLIForeman::InfoCommand
      output SCCAccountsCommand::ListCommand.output_definition
      build_options
    end

    class CreateCommand < HammerCLIForeman::CreateCommand
      success_message _('SCC account created.')
      failure_message _('Could not create SCC account')

      build_options
    end

    class DeleteCommand < HammerCLIForeman::DeleteCommand
      success_message _('SCC account [%{name}] was deleted.')
      failure_message _('Could not delete the account')

      build_options
    end

    class UpdateCommand < HammerCLIForeman::UpdateCommand
      success_message _('SCC account [%{name}] updated.')
      failure_message _('Could not update the SCC account')

      build_options
    end

    class SyncCommand < HammerCLIForeman::Command
      action :sync
      command_name 'sync'

      failure_message _('Could not sync SCC account [%{name}]')

      def execute
        response = send_request
        print_message('Sync process successfully started:')
        print_message(_('Started at: %{param}') % { param: response['started_at'] })
        print_message(_('State: %{param}') % { param: response['state'] })
        print_message(_('State updated at: %{param}') % { param: response['state_updated_at'] })
        print_message(_('Task ID: %{param}') % { param: response['id'] })
        HammerCLI::EX_OK
      rescue RestClient::UnprocessableEntity => e
        response = JSON.parse(e.response)
        print_message(_('Sync process failed, error: %{param}') % { param: response['error'] })
        HammerCLI::EX_TEMPFAIL
      end

      build_options
    end

    class TestConnectionCommand < HammerCLIForeman::Command
      action :test_connection
      command_name 'test_connection'

      success_message _('Testing connection for SCC account succeeded.')
      failure_message _('Testing connection for SCC account failed')

      build_options
    end

    class BulkSubscribeCommand < HammerCLIForeman::Command
      action :bulk_subscribe
      command_name 'bulk_subscribe'

      success_message _('Bulk subscribing successfully started.')
      failure_message _('Bulk subscription failed')

      build_options
    end

    autoload_subcommands
  end
end
