# Create GitHub repository from working directory
github_init() {
  local project_name="$(basename $(pwd))"
  git init
  git remote add origin "https://github.com/$(git config --get github.user)/$project_name.git"
  test -f README.md || echo "# $project_name" > README.md
  git add -A
  git commit -m "Initial commit"
  echo "Creating GitHub repository..."
  curl -s -H "Authorization: token $GITHUB_TOKEN" https://api.github.com/user/repos -d "{\"name\":\"$project_name\"}"
  git push --set-upstream origin master
}
