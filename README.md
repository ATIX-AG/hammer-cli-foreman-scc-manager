# Hammer CLI Foreman SCC Manager

This Hammer CLI plugin contains set of commands for [foreman_scc_manager](
  https://github.com/ATIX-AG/foreman_scc_manager
), a plugin to Foreman for the SCC Manager.

## Versions

This is the list of which version of Foreman SCC Manager is needed for which version of this plugin.

| hammer_cli_foreman_scc_manager |    v0.1.0 |  
|--------------------------------|-----------|
|            foreman_scc_manager | ~> v1.8.6 | 

Version v1.8.6 of foreman_scc_manager is preferred, but most functionalities are also available with older installations.

## Installation

    $ gem install hammer_cli_foreman_scc_manager

    $ mkdir -p ~/.hammer/cli.modules.d/

    $ cat <<EOQ > ~/.hammer/cli.modules.d/foreman_scc_manager.yml
    :foreman_scc_manager:
      :enable_module: true
    EOQ

    # to confirm things work, this should return useful output
    hammer scc_manager --help

## More info

See the [Hammer CLI installation and configuration instuctions](
https://github.com/theforeman/hammer-cli/blob/master/doc/installation.md#installation).
