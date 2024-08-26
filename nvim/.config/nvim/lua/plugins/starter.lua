local function polite_generator()
	local hour = tonumber(os.date("%H"))

	local day_part = ""

	if hour >= 6 and hour < 12 then
		day_part = "morning"
	elseif hour >= 12 and hour < 18 then
		day_part = "afternoon"
	elseif hour >= 18 and hour < 21 then
		day_part = "evening"
	elseif hour >= 21 then
		day_part = "night"
	end

	return "Good " .. day_part .. ", " .. vim.fn.system("whoami")
end

local Headers = {
	decimal = {
		"[ 78 101 111 86 105 109 ]",
		polite_generator(),
	},

	camel = {
		[[              ,,__                               ]],
		[[    ..  ..   / o._)                   .---.      ]],
		[[   /--'/--\  \-'||        .----.    .'     '.    ]],
		[[  /        \_/ / |      .'      '..'         '-. ]],
		[[.'\  \__\  __.'.'     .'          `-._           ]],
		[[  )\ |  )\ |      _.'                            ]],
		[[ // \\ // \\                                     ]],
		[[||_  \\|_  \\_                                   ]],
		[['--' '--'' '--'                                  ]],
		polite_generator(),
	},
}

return {
	"echasnovski/mini.starter",
	opts = {
		query_updaters = "abcdefghijklmnopqrstuvwxyz0123456789_.",
		header = vim.fn.join(Headers.camel, "\n"),
	},
}
