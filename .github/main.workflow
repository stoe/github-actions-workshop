workflow "Test on push" {
  on = "push"
  resolves = [
    "npm demo"
  ]
}

action "npm demo" {
  uses = "./actions/demo"
}
