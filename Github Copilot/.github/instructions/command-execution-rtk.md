# Command Execution & RTK Output Compression

- Use `rtk` when command output is likely to be large or repetitive and a filtered summary is sufficient (e.g., test suites, builds, linters, logs, broad searches, dependency listings).
- Use raw commands when output is expected to be short, when exact output matters, or when inspecting a specific file or traceback.
- In command chains, apply `rtk` only to segments that benefit from filtering.
- If RTK hides needed detail, rejects a command, or complicates debugging, rerun the command raw. Do not use `rtk proxy` merely to satisfy a convention.
