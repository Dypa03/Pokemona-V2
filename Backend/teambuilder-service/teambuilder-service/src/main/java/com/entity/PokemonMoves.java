package com.entity;

import jakarta.persistence.Column;
import jakarta.persistence.EmbeddedId;
import jakarta.persistence.Entity;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.MapsId;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "pokemon_moves")
public class PokemonMoves {
    @EmbeddedId
    private PokemonMovesKey id;

    @ManyToOne
    @MapsId("pokemonId")
    @JoinColumn(name = "pokemon_id")
    private Pokemon pokemon;

    @ManyToOne
    @MapsId("moveId")
    @JoinColumn(name = "move_id")
    private Move move;

    @Column(name = "learned_through", nullable = false)
    private String learnedThrough;

    @Column(name = "at_level")
    private int atLevel;

    @Column(name = "at_chapter")
    private int atChapter;

}