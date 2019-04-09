workflow "Test on push" {
  on = "push"
  resolves = [
    "npm test (10)",
    "npm test (latest)"
  ]
}

// Node@10
action "npm ci (10)" {
  uses = "docker://node:10-alpine"
  runs = "npm"
  args = "ci"
}

action "npm test (10)" {
  needs = "npm ci (10)"
  uses = "docker://node:10-alpine"
  runs = "npm"
  args = "test"
}

// Node@latest
action "npm ci (latest)" {
  uses = "docker://node:alpine"
  runs = "npm"
  args = "ci"
}

action "npm test (latest)" {
  needs = "npm ci (latest)"
  uses = "docker://node:alpine"
  runs = "npm"
  args = "test"
}
