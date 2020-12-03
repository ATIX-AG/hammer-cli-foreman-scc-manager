# frozen_string_literal: true

module HammerCLIForemanSCCManager
  class SCCProductsCommand < HammerCLIForeman::Command
    resource :scc_products

    class ListCommand < HammerCLIForeman::ListCommand
      output do
        field :id, _('Id')
        field :name, _('Product name')
        field :friendly_name, _('Friendly product name')
        field :scc_account_id, _('SCC account id')
        field :arch, _('Architecture')
        field :product_id, _('Katello product id')
        field :description, _('Product description')
      end

      build_options
    end

    class InfoCommand < HammerCLIForeman::InfoCommand
      output SCCProductsCommand::ListCommand.output_definition
      build_options
    end

    class SubscribeProductCommand < HammerCLIForeman::Command
      action :subscribe
      command_name 'subscribe'

      success_message _('Subscribing to product succeeded.')
      failure_message _('Subscribing to product failed')

      build_options
    end
    autoload_subcommands
  end
end
