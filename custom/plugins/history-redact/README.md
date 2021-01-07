# ZSH Shell History Redaction
This plugin helps prevent some secrets or tokens from ending up in your ZSH shell history

This plugin creates a file `~/.zsh_history_redact_patterns`. 

Enter grep patterns in this file and history lines will be checked against these patterns before being
written to history. Any matches and the history line will be discarded.
