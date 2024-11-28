make_gophermap() {
  if [ ! -d "${HOME}/public_gopher" ]; then
    printf "Creating gopher hole\\n"
    mkdir "${HOME}/public_gopher"
  fi

  if [ ! -L "${HOME}/public_gopher/blog" ]; then
    ln -s "${HOME}/public_html/blog/" "${HOME}/public_gopher/blog"
  fi

  cat <<- 'EOF' > $HOME/public_html/blog/gophermap
  #!/bin/bash
  echo -e "my bashblog posts\n"
  user=$(stat -c '%U' .)
  for post in $(ls -t *.md); do
    post=$(basename $post)
    echo -e "0$post\t/~$user/blog/$post\ttilde.club\t70"
  done
  EOF
  chmod +x $HOME/public_html/blog/gophermap
  chmod 644 *.md
}
