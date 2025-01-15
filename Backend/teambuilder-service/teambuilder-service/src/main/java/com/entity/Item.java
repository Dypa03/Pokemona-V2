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
@Table(name = "items")
public class Item {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "item_id")
    private int itemId;

    @Column(name = "name", nullable = false, length = 50)
    private String name;

    @Column(name = "effect", nullable = false, columnDefinition = "TEXT")
    private String effect;

    @Column(name = "is_consumable", nullable = false)
    private boolean isConsumable;

    @Column(name = "chapter", nullable = false)
    private int chapter;

    @Column(name = "type", nullable = false, length = 20)
    private String type;
}