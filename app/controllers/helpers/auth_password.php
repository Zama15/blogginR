<?php
$password = $argv[1];
$hased_password = $argv[2];

if (password_verify($password, $hased_password)) {
  echo 'true';
} else {
  echo 'false';
}
?>