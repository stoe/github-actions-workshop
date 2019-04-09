workflow "Test on push" {
  on = "push"
  resolves = ["test"]
}

action "build" {
  uses = "actions/npm@master"
  args = "install"
}

action "test" {
  uses = "actions/npm@master"
  needs = ["build"]
  args = "test"
}
