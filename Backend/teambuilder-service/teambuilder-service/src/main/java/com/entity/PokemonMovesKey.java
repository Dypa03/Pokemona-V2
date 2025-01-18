package com.entity;

import java.io.Serializable;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Embeddable
class PokemonMovesKey implements Serializable {

    @Column(name = "pokemon_id")
    private int pokemonId;

    @Column(name = "move_id")
    private int moveId;

}