class user_account ( 
    $users = hiera('user_account::users'),
    $groups = hiera('user_account::groups')
){
    # Default resources managed for users
    $user_classes = [
        'user_account::screenrc',
        'user_account::bashlib',
        'user_account::bashrc'
    ]

    class { 'user_account::exist':
        users  => $users,
        groups => $groups,
    } ->
    class { $user_classes:
        users => $users,
    }

}
