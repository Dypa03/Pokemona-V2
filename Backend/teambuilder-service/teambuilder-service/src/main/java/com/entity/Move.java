package com.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
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
@Table(name = "moves")
public class Move {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "move_id")
    private int moveId;

    @Column(name = "name", nullable = false, length = 50)
    private String name;

    @Column(name = "type", nullable = false, length = 20)
    private String type;

    @Column(name = "power", nullable = false)
    private int power;

    @Column(name = "accuracy", nullable = false)
    private int accuracy;

    @Column(name = "pp", nullable = false)
    private int pp;

    @Column(name = "priority", nullable = false)
    private int priority;

    @Column(name = "effect", nullable = false, columnDefinition = "TEXT")
    private String effect;

    @Column(name = "move_type", nullable = false, length = 20)
    private String moveType;
}