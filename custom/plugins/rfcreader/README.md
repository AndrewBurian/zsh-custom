# RFC Reader

For working locally with RFC documents, caching them for quick or offline use.

Downloads and opens rfcs for viewing in terminal, with the pager set to the size of the RFC
document page (56 lines). Use <space> to advance one page and <b> to back up one page.

## Commands

`rfc <number | alias>` open an RFC (number or alias) with `less`
`rfcname <number> <alias>` create an alias for a numbered rfc for easy access
`rfcls [ls-flags]` equivalent to `ls [ls-flags] $RFC_ALIAS_PATH`

## Environment

`RFC_PATH` where in the local filesystem RFC text should be stored. Defaults to `~/Documents/rfcs`
`RFC_ALIAS_PATH` where in the local filesystem alias symlinks should be created. Defaults to `~/.rfc/alias`
