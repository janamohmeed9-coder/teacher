package com.example.teachersms.security;


import com.example.teachersms.entities.User;
import com.example.teachersms.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.userdetails.*;
import org.springframework.stereotype.Service;


@Service
@RequiredArgsConstructor
public class CustomUserDetailsService implements UserDetailsService {
    private final UserRepository userRepository;

    @Override
    public UserDetails loadUserByUsername(String username)
            throws UsernameNotFoundException {
        User user = userRepository.findByEmail(username).orElseThrow(()->
                new UsernameNotFoundException("User not found.")
        );
        return new CustomUserDetails(user);
    }

}