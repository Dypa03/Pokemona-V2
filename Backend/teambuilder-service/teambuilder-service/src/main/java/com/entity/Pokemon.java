package com.entity;

import jakarta.annotation.Generated;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToMany;

@Entity
public class Pokemon {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String name;

    private String form;

    private String type1;

    private String type2;

    @ManyToMany
    private String ability1;

    @ManyToMany
    private String ability2;

    @ManyToMany
    private String hiddenAbility;

    @Column(name = "base_hp")
    private int baseHp;

    @Column(name = "base_atk")
    private int baseAtk;

    @Column(name = "base_def")
    private int baseDef;

    @Column(name = "base_sp_atk")
    private int baseSpAtk;

    @Column(name = "base_sp_def")
    private int baseSpDef;

    @Column(name = "base_spe")
    private int baseSpe;

    @Column(name = "is_legendary")
    private boolean isLegendary;

    @Column(name = "pokedex_number")
    private int pokedexNumber;

    @Column(name = "has_mega")
    private boolean hasMega;

    private int chapter;

}
