#!/usr/bin/env python3
import i3

def main():
    ws = i3.get_workspaces()
    trpl = ws + ws + ws # three times, because if we're on workspace "10" then we need to be able to go two times forward
    for i, ws in enumerate(trpl):
        if not ws['focused']:
            continue
        next_ws = i + 1
        if "10" in trpl[next_ws]['name']:
            next_ws += 1
        i3.command('workspace', trpl[next_ws]['name'])

main()
