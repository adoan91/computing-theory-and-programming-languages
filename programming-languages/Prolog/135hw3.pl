/*facts*/
likes(charlie, dankmemes). /*charlie likes dankmemes*/
likes(anthony, alchemy). /*anthony likes alchemy*/
likes(liza, pokemon). /*liza likes pokemon*/
likes(charlie, pokemon). /*charlie likes pokemon*/
likes(anna, pokemon). /*anna likes pokemon*/
/*rules*/
memelord(X) :- likes(X, dankmemes). /*X is a memelord if X likes dankmemes*/
alchemist(X) :- likes(X, alchemy). /*X is a alchemist if X likes alchemy*/
trainer(X) :- likes(X, pokemon). /*X is a trainer if X likes pokemon*/