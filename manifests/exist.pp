class user_account::exist ( $users, $groups = [] ) {

    define user_exists ($user = $title, $grps) {
        user { $user:
            shell       => "/bin/bash",
            managehome  => true,
            groups      => ['users', $grps].flatten,
        }
    }

    # Call the define for every member of the users array passed in
    user_exists { $users:
        grps => $groups,
    }

}
