#!/bin/bash

SYSROOT="/home/gad/Documents/cours/sysroot_zybo"

find "$SYSROOT" -xtype l | while read -r link; do
    target=$(readlink "$link")
    abs_link_dir=$(dirname "$link")

    # Si la cible est absolue
    if [[ "$target" = /* ]]; then
        new_target="$SYSROOT$target"
        # On veut que le lien pointe vers la cible relative à $abs_link_dir
        rel_target=$(realpath --relative-to="$abs_link_dir" "$new_target")
    else
        # Cible relative, on essaie de la corriger si besoin
        # On vérifie si la cible existe dans le sysroot
        if [[ ! -e "$abs_link_dir/$target" ]]; then
            # On cherche si la cible existe ailleurs dans le sysroot
            found=$(find "$SYSROOT" -name "$(basename "$target")" | head -n 1)
            if [[ -n "$found" ]]; then
                rel_target=$(realpath --relative-to="$abs_link_dir" "$found")
            else
                echo "Cible introuvable pour $link ($target)"
                continue
            fi
        else
            rel_target="$target"
        fi
    fi

    echo "Corrige $link -> $rel_target"
    rm "$link"
    ln -s "$rel_target" "$link"
done 