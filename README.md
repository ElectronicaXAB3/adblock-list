# AdBlock List

O lista cu filtre pentru blocarea continutului nedorit, in special de pe website-urile pentru electronisti (bloguri, magazine, producatori, distribuitori, etc).

Lista a fost construita deoarece ne pierdem prea mult timp online dand tot timpul click pe popup-uri inutile.

Filtre au fost testate doar cu [uBlock Origin](https://ublockorigin.com/).

# Adaugarea filtrelor

Adauga manual urmatoarea adresa in lista de filtre a ad blocker-ului tau.

```text
https://raw.githubusercontent.com/ElectronicaXAB3/adblock-list/main/merged-filters.txt
```

# Concatenarea filtrelor

Filtrele individuale se afla in folderul `filters` al acestui repository.

Cine nu doreste sa utilizeze toate filtrele, poate sa adauge individual fiecare filtru in parte in ad blocker.

Pentru concatenarea filtrelor, foloseste scriptul bash `scripts/merge-filters.sh` sub forma

```bash
cd scripts
bash merge-filters.sh
```

Ca rezultat, fisierul `merged-filters.txt` va contine suma tuturor filtrelor.
