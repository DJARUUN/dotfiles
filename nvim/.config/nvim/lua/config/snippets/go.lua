return {
	s("iferr", t({ "if err != nil {", "\tlog.Fatal(err)", "}" })),
}
