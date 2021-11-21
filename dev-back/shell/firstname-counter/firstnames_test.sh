check_without_file_provided () {
  echo "Running test 0 / 1..."
  SUCCESS=0
  CMD_WITHOUT_FILE=$(echo ./firstnames.sh 2>&1);
  if ! $CMD_WITHOUT_FILE; then
    echo "Success: Program successfully exit when no file provided"
    SUCCESS=1
  else
    echo "Fail: Expect program to fail withou file provided"
  fi

  echo "Test valid : $SUCCESS / 1"
}

check_with_file_provided () {
  CMD=$(echo ./firstnames.sh examples.txt 2>&1);
  SUCCESS=0
  if ! $CMD; then
      echo "Fail: Command failed"
  else
    if $CMD | grep -q "Firstname 'Julie' appeared 6 times"; then
      echo "GG! You found Julie 6 times in the list !"
      echo "Success: Command succeed"
      SUCCESS=1
    else
      echo "Fail: Result found seems to be different than solution"
    fi
  fi

  echo "Test valid : $SUCCESS / 1"
}

check_without_file_provided
check_with_file_provided

exit 0
