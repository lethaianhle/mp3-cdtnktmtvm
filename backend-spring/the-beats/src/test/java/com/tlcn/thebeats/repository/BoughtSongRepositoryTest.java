package com.tlcn.thebeats.repository;

import com.tlcn.thebeats.models.Song;
import com.tlcn.thebeats.payload.response.BoughSongResponse;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class BoughtSongRepositoryTest {
    @Autowired
    BoughtSongRepository boughtSongRepository;

    @Test
    void getSong() {
        List<BoughSongResponse> list = boughtSongRepository.getBoughtSongArtist(1L);
        list.forEach(System.out::println);
        assertNotNull(list);
    }

}