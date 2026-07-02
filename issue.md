# Bug Report

## Summary
Blog post preview cards on the homepage display broken/corrupted layout when the post's summary contains a Markdown link.

## Steps to Reproduce
1. Write a blog post that **does not** have `<!--more-->` and contains a Markdown link (e.g., `[example](https://example.com)`) near the beginning of the content
2. Or, write a blog post **with** `<!--more-->` but include a Markdown link in the summary section (before `<!--more-->`)
3. Go to the homepage where post previews (summary cards) are displayed
4. Observe the preview card — the layout is broken, text overflows, or the link swallows surrounding content

## Expected Behavior
The summary should display as plain text (without clickable links) in the preview card, or at least render the link properly without breaking the card layout.

## Environment
- **OS**: macOS 15 Sequoia
- **Static Site Generator**: Hugo v0.145.0
- **Theme**: dream (tried updating to latest version, still broken)

