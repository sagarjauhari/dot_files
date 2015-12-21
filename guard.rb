#!/usr/bin/env ruby
#
# guard.rb
# Copyright (C) 2015 sagar <sagar@Sagars-MacBook-Pro.local>
#
# Distributed under terms of the MIT license.
#

notification(:tmux, {
  timeout: 0.5,
  display_message: true,
  display_title: true,
  default_message_color: 'black',
  display_on_all_clients: true,
  success: 'colour150',
  failure: 'colour174',
  pending: 'colour179',
  color_location: %w[status-left-bg pane-active-border-fg pane-border-fg],
}) if ENV['TMUX']
