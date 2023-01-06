module main

import vweb
import os
import flag
import time

struct App {
	vweb.Context
}

// v run main.v -p 8888
fn main() {
	// Handle arguments
	mut fp := flag.new_flag_parser(os.args)
	fp.description('
  This is sample web app.')

	port := fp.int('port', `p`, 8080, '[optional] port (default: 8080)')
	help := fp.bool('help', `h`, false, 'help')

	// Valid required options.
	if help {
		println(fp.usage())
		return
	}

	// Start web application
	println('${time.now().format_ss_milli()} Start vweb app.')
	vweb.run(&App{}, port)
}

struct GetResponse {
	query_parameters map[string]string
}

['/'; get]
pub fn (mut app App) get_endpoint() vweb.Result {
	// query_string := json.encode(app.query)
	return app.json_pretty(GetResponse{
		query_parameters: app.query
	})
}
