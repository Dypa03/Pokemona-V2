package com.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToMany;
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
@Table(name = "pokemon")
public class Pokemon {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    
    @Column(nullable = false)
    private String name;

    @Column(nullable = false)
    private String form;

    @Column(nullable = false)
    private String type1;

    private String type2;

    @ManyToMany
    @Column(nullable = false)
    private String ability1;

    @ManyToMany
    private String ability2;

    @ManyToMany
    private String hiddenAbility;

    @Column(name = "base_hp", nullable = false)
    private int baseHp;

    @Column(name = "base_atk", nullable = false)
    private int baseAtk;

    @Column(name = "base_def", nullable = false)
    private int baseDef;

    @Column(name = "base_sp_atk", nullable = false)
    private int baseSpAtk;

    @Column(name = "base_sp_def", nullable = false)
    private int baseSpDef;

    @Column(name = "base_spe", nullable = false)
    private int baseSpe;

    @Column(name = "is_legendary")
    private boolean isLegendary;

    @Column(name = "pokedex_number", nullable = false)
    private int pokedexNumber;

    @Column(name = "has_mega", nullable = false)
    private boolean hasMega;

    @Column(nullable = false)
    private int chapter;

    @Column(name = "evolves_into")
    private int evolvesInto;

    @Column(name = "gender_rate")
    private int genderRate;

}
