// A LinuxMain.swift file is no longer needed since `swift test --enable-test-discovery` is possible
// Provide an error message when testing on Linux with no automatic test discovery
#error("""
    -----------------------------------------------------
    Please test with `swift test --enable-test-discovery`
    -----------------------------------------------------
    """)
