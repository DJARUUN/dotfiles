return {
	s("iferr", t({ "if err != nil {", "\tlog.Fatal(err)", "}" })),
	s("print", t({ "fmt.Println" })),
}
