/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50725
Source Host           : localhost:3306
Source Database       : kitty

Target Server Type    : MYSQL
Target Server Version : 50725
File Encoding         : 65001

Date: 2019-11-10 12:14:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for kt_admin
-- ----------------------------
DROP TABLE IF EXISTS `kt_admin`;
CREATE TABLE `kt_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `headimg` text COMMENT '头像',
  `nickname` varchar(100) DEFAULT NULL COMMENT '昵称',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `admin_role_id` int(11) DEFAULT NULL COMMENT '角色id',
  `state` tinyint(4) DEFAULT '1' COMMENT '状态 1-正常  2-禁用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='管理员表';

-- ----------------------------
-- Records of kt_admin
-- ----------------------------
INSERT INTO `kt_admin` VALUES ('1', 'admin', 'e6b8xbDwHQe49QcHwNzIgrz3FiLylOPzr50AU_sGQzpQX031bQ', 'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAMCAgICAgMCAgIDAwMDBAYEBAQEBAgGBgUGCQgKCgkICQkKDA8MCgsOCwkJDRENDg8QEBEQCgwSExIQEw8QEBD/2wBDAQMDAwQDBAgEBAgQCwkLEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBD/wAARCAFNAU0DASIAAhEBAxEB/8QAHQAAAAcBAQEAAAAAAAAAAAAAAQIDBAUGBwAICf/EADcQAAEEAQMDAwMDAwQBBQEBAAEAAgMRBAUSIQYxQRMiUQdhcRQygQhCkRUjobHBJDNS0eEW8f/EABsBAAMBAQEBAQAAAAAAAAAAAAABAgMEBQYH/8QAIhEBAQADAAMBAAMBAQEAAAAAAAECAxESITEEBRNBIlFh/9oADAMBAAIRAxEAPwDV9Re1xIPxx91XtQdsa5103jhS2VK7ebBJHA4UPmjfbnH2nheXHazz6gaJHqOKMlrKIs+xvN/KyCSCdk7oCLLe5HhegNUiM0T20O1C/KyjWNJfiam+aOOwHEE7a7ro13sZ1W4MR7ntc9pAJrtakpenpntE0DS5vzVWtF6Q6d03WoWxS44ZL2CucXQDsIhpxt7XCgR2paHKwaHQpS7Y6Mg2CD4v4UthdGTk/qIo7cDfHhbPF0LEHlj8ZpYef28hP2dC5GLT4oiGEeB3CE1mfTvT2VFkNnbGN393HH5Wt9H6Dhak4RSQhsruBbfPypTp3oYTyNL4S01wCKsrQdB6M/SP3gGxRHHKVoZ31D9KGzSsmiaC7+41wEvof0xygGRnHbsHG4D9y3fF6fE8dZEYv8eFL4GhY+NH6bogRe4fZPosZNgfShszGuMILh3FI+qfRyGVvrMx2scPFd1tePhshIe1g/wlnY4l5P55SuRcYjifSwmIxPhZQHAKd6Z9JoMbNbkCIbmntXC2NmFHVbBfylo8UCvaD5S8hxU8HorChaCMaMiuTXNqxYmh4cMIayIc0SSFKNha2qHCUDB/CPMcIQ4jIm7WiglhGOAB2SjQOyENrlT3pihgRmtH+Udo+QjbeUv8AhbzdWV20g8BKrqJQCe35KGvsj15XV8hAJhvHa0X0ylq/wCUO3ikugh6YtAWfZL7SgLTX2UnKRLfNIj4+PCcbTXCIQebCVnVyo3Jw2PabaOygcjTnwvPuNA/CtjmA8EJtkY7Xg0OVzbtXlG2GyxVpYDZHAKbvi2N5U3lYRBuvuSo7IjIsNF0vN3aOR1a9nUQ8kEn4PnyqV1nhueDI1wbXf7q8ZDHBxLuw+FWuq4PWxHGMH5HC8vLHlehrrzR9YNKbnaFkMLd3tI58FeE9exBi6tkQObtLXkBfRbr3DjyNPmYWXQ8+V4K+p2A/E6knayPaNx7jle//EZ/cXnfyGPzIT6Y5TY+oIoJAHeo4CvsvT0HS+dLjxSYM1Nc0Egml5D6e1FmlapBmPe4BjgdwHIor2b0X1LpepaDjzQ6lC87G7+aINeVj/K6rM5lP9ex/Cbpddwt9tNypZHEgkbR5UbMA4e4+0dwE+mlBYWnseVHWbLiDt/6XqPmaZSYIlva4lvwofJ6ZGbLudHu57VyrRjOLZQOCwnyrlg9OMz2RyQ8P44pa4ekVSumOkGYc8Ykikg3OFH/APVs2ldN+riBkuyQV7XAWi6V0z/tN/UM3HtfcBXDRML9D/6d7bHYFaWiRXT0jA9vvjG7xwn2D0pCYzjvZbvBrhXRuGx/cCz9k4x9PDXgu8VVKeixWMPpUYcgcRbfHHZWTD0xoaLYBt57KUEF2AAbS0UQAojt8o6J6IsgLR+0f4ThkQDqopVsYvjulmxg18/KXTJNjDeADRSjYSDYCW2DyEZjSOChAoZXhdsHYBKbebHCGh8IDg3jtwuDUYA97QE890Hx1H4QgfK66FoRzSCCK44Rq5s90A7I9WgAo90NGqtcG890YCkAABq6Q7UKAizaA4NXBvhGAtc6weFIFLaBQVaN3HPddVDskBdtcIjm89koTS6vhCoQfH4Sb2A905rk+URzCTaVnVS8R8+MJWkAflRWTp7mE8Gj5Vic3wkZotze3K59uvyjXDPxUjLx5G7z6ZP4UHqmI2XFkv2uaD+OVc9SwnbXhgu1XM3EeIXscw8iiPheLv0eNelp2dYX1VgNIkjlH7LJryvDH180r9Jrs00Y/e7g/ZfQnq/TnPfIyNzS0nue/wB148/qT6di9F+UItpaSLoc8Lo/jcvDbxP7Z5a3lm2gDdzYsqc0/qTVMCH08PUpomnuGuIUPOGtft9PaPB+6FjSRw3hfS5a8dk5lHja9uWu9xvH0ZZN6g97QPCRc0l5aLo9vulcXHOQ245AfIU3h9O5Uga9vuAN0Qubi+mmn4BftdsrkEnutV6TwYJYRHIzk1TvhV3R+m54miSQs2k/tHJV90PBZDRa3Y4n9vhUErj6acYbhy2/8qYxsfcRbeO5CDEY9zNjmAk9gpKPHO0Eg2eErQUigFB3aj/lOwxtWP8ACTZEaDbpLM3NdtcEQDNb5PCWYyiDxykS2ju3JzELbwmBmx2eCjhtUha0CjSOEFXAHyO67sUalxFhCRv3dkVC0lqMeeUKALQEUjgWgIQYAUcIobzwjXzyhNCEYFFQg+Al0hr5RgeUUd0O74RKBj+O6BFBJKOBY7pUOpcb/wALr5u1xRA7ikHdchsIgAgJKG+aQUfKR9dyuIsoVyY6I9vwknt44CXP2QFvFFTZ1UqOyMcPYRXJVa1bFcGuaG8EEWrg9v2tRudgCfgtPPwuTfq8o6dOzjD+rMB7P9xhoVTqC82/XbpOXVNBy3FopjC5pPcnxS9k9T6GXRbWxWLsmvCxf6g9LtzcDIina3bKx1N7UaXFp13Xn13Z5zPB8v8AUsOTGynwNa7cw8hyZESDmjz8Fa/9ROgH6JrEkZiDw8ucHA/dZrlaZJHKWtAAvsTS+kwvcXhZeq+l+jdFz5EbZMdpdTgSWrROm9BMQEU0dcbef+0r0tpeTjYzHBwJFFwCuePjse0O9NoH/S5a3kRkGhY0dMDRVm6HdSGLpQItraI5aPlScGMwkbeU9ix/T9zQiUyWJiua1txj/wAp8GVyuYSKJRyQR3N90kuoN5rhCByKRQBwSb+yPXO4G1X+AYNv7JRjqNHhJB4PnlKgNce6UBdvhHBpJtBA5KVa2h2VAYEWhAo2irmus+UJnscgFCBxQNoPyhv47IUD5Qnsuvn7LieKQAtB5K4+ELf20uSDgjDhFuuV2+x27qSGseFyKOEYfdCXIwqkA5KE9u6AHgd0BI7ILNUu48oAQfCGx8ooK4BACe9ruT2XGyuB8IAO/lGH3QAeUKA5ceVy5ByiOZZsUkpGcc9k4IsJN4B4U2dXLxF6hhxTQkOb/jys16w6XGRjztjgJ3djS1hzAbsKL1bB/UQujEfDgQaWGWv31tjnecfPf60fTbKZPJO+VhPNAcbR5XmHqfQsPH1AwtzHU2/7V9H/AKwfSrU9VY6bDjcWusEBeUepPobqTNSeZsUkknxyF36svXHLsnt9B8OCKAO2MA3VdBSbImgDsAUhjvi4pu4O7J9HRAaQCAsWrscCIkhws9rT9rhts+fKaGJjm1VH5XRukYC11n+UFw5LuCL5KGMlzuUmxwIsFKiRo7top/4RZp5Ft4Rm1ZpEBJAIKKS9pAvugFjHu9wHK4bw7t27IGOcfH5SrCD+5EA7HWOQlWk/KTHARgfkqgUHJ5QgUbRCSOUZrge6RFLsCl3byusIDanphRh9wEUkHm0F88IA/bsgs2gc4+Fw7IAfuuAtcPhGQHDujotgIb4tBcCh5qqRQQUbn+UDjvtSKee6HcOwQcfKDcBSEGigvml1hBOs7vshslASPlBuQVn/AINZQ7vlEs3aEO8Ugh/va6vFIGm+6EKodciu/COfuinspOCObY/CSewUljZ8ojh4SsPqC1zCkysV4aOwsUF5t630nNi1d3tHJPLW916nyId8ZaPIWf8AUHS4mzN7fSo2QHDsqxvB9diGaMMdsJ8ceFKRSHhxFHymUUzoyBVWnLHm6k4s80pij7fbdw7Hmkb1GnmwPsm1tbTg+wjhtjwfgpg5jkBPLB9uUtbi22lM2t42tJBS8T3cBxpBU4bKa2uCUAB7HskKcPcQjtlAFEJ9Idrw11HynDXA89k19rux/lC0StdZPHyiA9byKvuupzT3SUZJ+6VD/CLQUb2tG7G0m13FhDuvkDskCu4IwIPm0kHBGDqPAQBhVLuPC4mxaLfKAOFxNBA1w7ISgDbjS4FFDrNIUugcHwCh7lFAF90biuEdAaCAlBZXJBy5cgJpIBQE0g5I7oT8q4Adrq0IvygvhCTSAFC1F3IWlBWDi0fjwk9xHcIwcKT6VC4+UF+UN3ygcfCQ+ANd/wDKIeUY2EV5IKDJSN8BV3VtL1CWcOxpGkc3bqKsT9wtRuXNOx42s7/AtBqTHkWADdjtZSrJy51F3PxajIZxtoAl3YJZheSDtFjnuo60sTEO4i+5TuI7Ry7hRcOSCaBq09gksi3Agqok+ZYILCCltocP9wUfsko2s4c32pePabDxY+UyopdNDRu22lWZUbjT2gfCI9rOdjuPum7xxZbfi0EkgI3UWkIHuc2h3A8qPjthFPNd/wAJxHMTx3RAdRTNPANFOHOFWO6Y+08sIaQl4pnH2uCAWEguuyHnvaTOzuByg9Xa6igF2uSocm5PFhKscSOyAUDrFDhDfPhJ9ghBN8JQDjgod18IhdyuBBStA4HNgowNogIpCHG0gUBooyIuQBgV24Im4LtwQB7CKg3d0W/ugDriT2tF+9oSPuqgCTXC5B57rif4TAUazfZEBKEEhAHQgm7RbvsjX9kEMD91xQE0hJ8WgWAQOXE/CK4nugwPBPZIPiBNu5+EsS7uCknvAPJpT0Mjjmpw2Dg/wnsT7IAJTKCN8lEVR8FPoI6e0O3X54UxpTmNjSboi0vGZIzbRYKNGYgRuYSnbWxyC9+z8K4kePNcSfUYQBxx5TyGdkgG2QA32co2WCZvMcrSPulITJGR6rAfmkyqQlDg3ffI+Cmr5Z2U4g13RvbJy1zmfYokjpo+CC8FBwvFksnABIYfv5RzBJ+6NwvuCmsUsBO57dp+E9imicAI5BfwUFRWvmDamj4HkIW5Lm+5p7eEZ8npg7hYSbzC8XHwfNfCBDmLKE3d209vyjvLnHaTyo+IiyCeT5Tr1QOEGdxykNonlLxSc0VHskDuWlOIpQRzdqelw8J8rmkDlIsks0UcOo1aRFC6/CM0jukwQUINDsg5ByTfdCDzY4RA74QgoKwo0n5RgebRGlGBQHICfAXFw+UmX8oOQoL55XA0a8pIFG+OeUDg+74Q8gIo7coTfak/hOsgWjE8Itnsu5pOUBB8hDZQN4C5MDiyjgfCSBRw41fCXQMbC7wgu/K7dXFpgJ4K4gEUFy5T0CGwLSMjSa4Tg9kk4WUHGX40cTm214DgeUux8Ubbc/k8VSjIY5C8BkjfhPIIueXbq7pRdOWZWLtt03lLjMia0enK1wI8FR78CGQWAe/HNcoWaTJGBtYS0+L5CqJSTc9rmgBpP4S36svIDQQkcbGdGyvTLfyljEG7XEijxwmCsUryaIIH4QSzu3UH0AOUpHI1oraXAfKOPQk7sAvyUAydGJRZftNJJrZ4ne1135B7J9JD6Y3Me1wHgJjLM1m4ua4HvfwgHwyi+PZIQXf8okUpDzRKhZM9sTg4yAHwUvjZrXvaWyA18JdCfYxj+RYKWA42uTCHLDtt0SfIUjYLNwHKVoFYza6zwlLIPeh9kO3c265CI2wPdyEgcwytvl3KdNNiyouZ/pm/lPsWYPjBQOHTRxVrj2pFa4E8IHPpACHAIzHEngJAO9yVjP3RAXHZAXcIm7ikH8p0uBLq5XA2bRAbNFGbQNJKGDSlA0Dk0i72gIWkDlVIkYccDlDXJQAgmwhsIpADaKNX3CHhCa8CkuAWuLRboldZHFru/PhO0+OBJKMO6CxVrhypIdCBZQAgmkIHKAMgsXSFAflA4A90kUoaKSIJPCLVMgx5WgjcDwPClIpYiwENLSRyLUVA2EncZgOLCdtfExrreD4H5QdLvkc8bY3kc8X4R4smbHfb5rb8Epm6Vo2t3g13CI5gddv4vwVUJNN1mFzdrmGlzpmylpY/aFFtgijojnwbR/XY01uDB4TCXLZCBsyRXxa6Ns37XPFfcqJfkNJFSD/yUyyNQDXUx7gR90qFmlZNsIZya/tKh8vJkja5jpHNdXO4dlG/6xLGTsyzfi0i/V8icH1GtkruVJ8MtVyJogS2Te088png60Wy8PMbuxtK5r2TtIPYg/woCWMx+8OHJ/yhTRdN1kzNbtoVX7j3VswMz1WckGu58LKNAz5G1HxuvyfC0LByN2O2SN23iiCnErQwh6I9hIJA5TfTcgyD3XY7/dSZaHDtSRIiaQtOyS06wZG1ttJZgcHcgH+EGGfdZ7/hTKEs228pKWTb3NI0b7oEpLNFsPlUCbZ+bJ4TqOQD4UJ+oDH7XWKUjjy3GKdacB9vF3a50rQOUkHDbVpu57i4tceE7ChwJL5BtFlyWNobufCaTZ2PiMc6WVrdovk0s+6m+omFpuTYyIyQewdwlIbTWzjguICEZuP2E7b+LWCal9WJ8qMjGzC1hHO3v+ExwPqE4uBeJnuu7BVcD0azJaf2m0qyWz5tYzpn1UnjH+/jSOYPICt+kfUrSs57YphsJHz2/KOF6XxrxYtKbmnhRuNqOJlM9THyGPb9inUcoca+EqJCxA+UBQ2PCKb8qem7nshaLIQD5Rgful0cGaKPKMSOyDsF1o6OOBpATx3XE+KRXUeUw7cBxaSkko+11IJDQsFMppHbuHhqzyy4qRlcWO3f7b48fKfMxN76MTuRaY4WeyN43sBDvv5Uu3NjcLAdY+Oy0KkH4bIwC5g/gou1kQLiLASzpuCSwkDwUyyMnaA0AAnvaqUhJNSaPYI3fn4UfkZ8YBJJNffsm2fmMDnOEu3aew7qHytWhZZ2vNg3x3TPiRn1gigxxsfdEb+ozJS/1Q2+TZVbOqsLrLdvIryncXUGPCKmdX3CVCxs0mZ/P6oV+UE2HPjgt3ih9+6reV1wzGDW47ATfdx+yYv67lyS57w0ntQPKODqYytRlxWkSRl1fCg8zU43guJog2QCo/U+sCWOccOQEf3d1U8rrfSTMW5LvRceObFlOY9Hk0DS+oYscOc6Wj9/+FonTOtnIZ6Zka7izR+y87Qa/h5UhbBkhw8bTdrROk+oJcUNl3Rlle7nlPnC71uOiatGzJ2Oc4bqAvsrmynMu7FeFjmnayyXKidE4OLSCaNLUNL1L18dpcBwPlLhd9lM5pvgXfFJGFjm0aCXyrfyyxSNAw+ny1Z03Ru9wJP8Jy5oe1N2tom+E4jPHdECHyscNlv7o+G8QuMbux55UhLjl9nbflMszFIb6jWkV3VwHDpmglpJBTSXKZAT6j9o8HvSrGt9RxYDDuymse3sHcLM+tvq07H0+RmPks3tBo7u3CZyHH1h+ozdHY+CPIFbSbB8fdeTOrvrEyCaeaTNAYXcHde5Vv6v/UnVNez348efLyCDQrhYn1DomtyQfqJt7oT7rcSKWuGBZXjSNT/qYkxS+PTYZJXtNWTQTfTv6pes4n+ozDY6MdwTVrEYGxiYtc26dX5Vu0LDw55Y4pWsO54Ow/C3muOe52PRXSv9Z36ZjIdf6fk29i6Mg/8Aa0jRf6kvpX1LIxn+qO07JfwBIdotYDnfTXp3O0M5DHGKZrNwI5/yFjLdKxcbVpsbJd+wnaWmiOVNwh45V9Qej/qScCWKTE1VmdhyEXteHUPnhegunNYj1jDjyoTbXi+6+SH0p6i1bR9cgw9P1af0pHBpjc4kEL6j/RYzS9KYk0w5cwc/wuXZONsb2NGYTSEnyjAe0IjvhY2qgQfJCGwSiF4/lCDaYKB1rieEUEBCeyCF3V3KBzuOSivka3ukJrouY5TllxUgMh/FefCicmYskLe/3tHy82WE00B1D5Ua/Ojkp24X5B8Lh37vFvrw7VAgwmsqy4/F+FJjL9GMN28pc4ry6mEfkpJ+O0OqWS6+F6TnIPy5Jjt3Fp+PCQkh9UEb3F9Vx8pSV8ELrYR2qymmRqHBEA213KDiOy8FrXHe8e1VrUXxNcBG66JBCsWVL67jKSbHdVvOlx2OcxrOf/k5OGhsuZ0Z3kt2k889lDajq/eIOBH2T7OkD9zSPaPPwqfmZkMeU71H0wdzaoqlIoZssOmmlLWd+6qfVX1b6B6Ja9mdqQlyGA3HGebWa/WP64ZOhYbtM6fygJXksJb3C8vZ02fr2dJqGr5cr3yEkklb4YdY5Zcei+o/6sNEka+LTsTLAN0S4EWqHP8A1FyZjtmXjl7b4J7rLf0WG0ta0izxZUhi9KfrC0NjDi7vXgLaa4y82m6P9Ypv1keRA/02l3LQfFr0d0R9ScDVMMFuSGyhlkE9vuvFmrdEa708xmWzHkkg4fvaLAUj0313qmkuc+KYh1bdpPcKMsV4V9CemuuWiYDIeSHkBr2Hlb50fr0eXisIcJAygDff/wDV84OgPqtmmaGKZhkEhHuv9i9m/RPVsnV42B76a4ggfCxyxsX16Ow7no9wR3TwMDOKSGnANgaO/CdyVX8LCrNJW7OW8osMh37XHklGksg32SUIAls8AeSlAkGi+Sk5ms2knwClI3Bw2g8JhrekZGoYb4sTNfjSkU1w7Ku8OTtYl9dJBFhukxXssNJNd14i6w611kOmwpZiWFxoC7/yvaHXn0+1nCa+XVsyWWM2bB9oC8o/UbofGjy58vGc/YTzwjDOd46cdNs6xrQZotV6mZDlkv3PAG75V9+qGm4+P02WxxMA23YFeFnz8F+m6+yeJrxseHB1V5V1616mw9T6ddAZQZmtA2+Txyu7H45Nk481ZjpIpX7bFP4Ke6Bqb2arE2WYgdibS2XDjZMsjX8VfIVfycKTHkGx24DsQtJXLY16T6gS6VH+kdkuEcjdocDdjyqfLM3UNQkyMZ5fvO4qA03T8/UZWRCN7hfG7stM6Q6TMhhxI8cue4jjy4qcjxi4/wBP3SuodQdV47m47nRxyN8L6wfT3SnaR05h4ju7YwKqq4XlH+lr6T/6UY82fGcxzve7c0cHxS9m4UYija0choAXFuylvI68MeQ8d+3hIvP/AClH2UjI6lhTcOOUIdzwkfWHYArvU8lBU4DvNo28EUkQ++ElNNs5tTllw5OlchrSw/hQ8+bJjvIc3hHydZix6LiC0mlWtW1YTTF0EnjkjsFx7t0xb69VyqSycqKbcbNjsoTIk2v9gI+UONkvko7r+SlQWkkkLyP0bvKu7Xr4JHhvk9oJI+yTydFySdwqqs0paCSOOT2EcijQTiWTeDtHBHK+p48hSczTnRmnkGyoTUGnHYXenuvgbeT/ACr3lYYlJ4HbilBahpM4bbGNF+CUlRRMzOdW0s2888+FBZWWwn3eeB+Vc83QZ5WmwPcaBqlVda6dyGRklwa6/bXlHTVPV82JrHG+brvwss61zJGYk8jLuiBS03L0GZxcJAavkg91Wdd6UGRjytFmmG7Cc+q48Z9TPOpapI7LG4scVVdTDcflpIs9qV9600yXRNelikaOXuHdUnqKCXaZY27m7f7eaXdh8ceavPzqk7uFHyrj0n1VGyRmFsNvNFx8D7LPZtzK3E3fITjDmkEzTHY+DflbRlXqHT+uNGxNKbi6pE1zQ2iHAGx8LHur/wDRpdQ/VaIxsUcrifTHcKqSavlTVFJK923zuUhomJLrGfj4wpofIGk32+6i+1Y3j0V/Tp9P8TqTUMefPY549RrWtH5X0s6A+mHT3T2nQTY2KGzFoIdf28rz9/ST9KOncLSMPNyZHSSNAeBVDcvXkfowRtiiADWigPCw2Xnppj7okcYxyGACgullB4DuU3lzY3O27qcD2+Ui+bd5pw7LmsbQ6/e2yET0xW5pRIpSWdz90qHAjgpcBSF+ymlO2u3N5TNg55/ynMY9tJHPqG6u0waro2Rj+mHuLDt+bXjfqrpbX8vMyWY2nukY1xbVVfK9xmPdz/wobL6R0jJmdN+la17uXEDuublmXXoatuMx5Xy/696G17DdPlO0bIY53taA26HzaxjXdH1wl/E8XFEUeV9kdS+m2hahGY8nBila4UQWhZR1V/St0xrE0mRp7GwE2S17e/2Xoa8+TlcW3/q+nyYk0PMY8gNfuv4SsXT2bI4F+O8k9vb2X0U1T+kFkUj3HBjfzxQTbS/6ZMHFnAyNOYQDyCOf4W39skc3ha8W9N9Ha5qT2Q4eA4iwN20ghepPox9FcWOXHydTilEzSOXN8LeunvovpOBGxsenxgN7gCj/ANLTdA6MxMdrA3FDNhB7Lk2/ot9YunDTjj7pfofQIdKxo4YGbQ0V2pX2FpaAAmeHgx44ADa8KQraFhj/APTyoHG7HwkZB4PlKOKReR5VJJOjFcOqkmfZ/ddrppaHDiE1fl7TZFgKfIHTsnYOQmGZqEde5wHCLl5sEUfqOe0X2BVV6i1iH0Lx5Wud8hcm/Z4zrbVruVNdc1V0bnNY4EO4IPcBROBqDZJTE4kbuFHZGe7JBMjTQ7kJrgyudktaDuHyvC3brlXq4avHFeMdpbxjneDzXwpAna1u5lEhI6XE1+Mw1yBynDo5LIaNwCwytpz1QlohJdV+OCnWNlxn2llNquU1cBOHe0hF9At5a+r8Er7Xvp4B9JNDt2iPn5TRwZI+nOodxYRoXANpx5+UcxtNl8f8pHELn4kbXbWSD3GzarGq6YX/APuEmrNNVwzMQlziCL+PsoTNxTRLZwOOzglxTONRwmR742Rnb3sjt/KgNR05skTnM93FOHawtG1TDk9LY1oeHf8Aaq+RjNY5wkbwTxXhNUeVfrv9ODqGM/VdMhIyICXPaG9x+V5fzcuSCR+NlsLRe1wIpfSDqfRBl4MjQ0Bjx7r5JXlv6ofRtubO7KxMcROJJc0C7C6NW3/Kyz199x5h1KHFmeZIpOKTFgkjAI58ceFes36f6lizOifjutpI/aaTdvRmayqgdZdVlq6pk5riq+NFJM7aGGzzR8rZ/oJ9N9Q6s6ngL8WT0GEONDuQeyiumfppl52TFvDxfP7Puva39P8A9PI9CETqYx1Dnb/wpyzkVMK9J/S3pTH6Y6cxoRjCOUR80eVa5tUkiOxspDfjyoSDUZcOBsLXB1NoJjkapO95c4i/gLkyva1xx4m/18vrAl9i+CnuPkzvcHF1juKVcxMp0xa0e6u4U3iPkjHBAAN15UqTceVtbVVx5KCLLErg1h8qq6rrXpOLS4tN0bPZOtE1eLJc2KM28D+D90FauWO4igef4T2P7JhiPtrbAHFp/GR4U2HKWARgB/KKCDx5RmkDup8VeQKDhX/KSkiHcBOLC4tvt2THTIwA8OY0/lN36Tiudv8ARbf47KT2hdsU9PqPZp8HiJt/hOGYzWdgAnAaPAQEeFNxlPyFDQBSBx47Ix7JNzqb2VcQK413JTTJk4O0pWeUAED45UbkTAEEHt4Svw4TycgiK+QRwoDN1KXHa6QP2gdwVLSZLDYd27BV/qAj9M6ZrbvwsbeKk6jtZ1dupaVL6Eg3t7FpVAw9XyXOfjZDr5oFxpMX6zJjZ80DZnMZuI2n7rseeGWdxlb37cd14/7c78er+TCJ8j/Z3R2Qe9+EhhtkOSNhLKNpxjBpYWchpA5STSI5dzJK5rleTa9Cz00rQ8prsJrXOa5xHNJ0drzbX1/KrPTEz3FsZ7Ad1YXwvjdQdd82m5cvVPmloB9lA8kJrlSs28Bo+yLJkSbb30DxaauqS93f5X2zwBG5Q9fa4kDx8Wnr5mPZuEhs+FFltS2W8BLunLdrBwK5BQCE0mW6Qhjjx8pnPjTvcd7hyFJse1zhuHJSeU6MWaLbHCFqxmQRjm+b7qt5uMwPO+QAu5shWbVHta40Xc/bgKt5rt5qxY7ICIy8dz47G1zTwQVUtX0PHyS7/wBO1xAq1ac1kjTdncOaUY6HJc6xwO/ZHxUrMtU6BwZ3vfJhtDu49o5Kr0306xnTtP6JhAd4HZbY7Sv1R20ef+EX/wDmm8kuaK7q5lU8Zt0/0bBjPDf0gAJobQLW69D6azBYxxZQa3wFBYGjQxkFtXf+KVuxpv0cLXg7dje47/4TuRcWd0sLGbnCm/KhczUoY3lz5WtA7cqv6t1IWNL3TUK7HhZF1h9VMTTjJFDlxh3Ngvo3/KJOpt426brHA0qRsr5g5hPdp5TfUPq5pUERezK2uFf3VwvHOufWXUGNfBG5sjTxe/uVQ9R+oGu5EjiMpxY7s3d2WkxR17M136yYUsrj+qab7Frkp0t9bcXEyA6PKi54pzvFrw1J1NrGQ+jkvH5KWx+odShO4ZBc4H5VTErX1G6d+r+h6nGA/KjY8D9pPdaJpOqnUY2zR8sePabXyd6b+qms6LmRSyzuLGPBPJql70/p7+ruJ1PpeO2fJB3MFN8g/dLLX6KZPREQ45P+Upx8pjDmtcAb78p02S+xWHGkKXSO08Gwkw4XSOK8KTCa4+6MAKRQL57owFoDiAR3RD9/whfx3KISgCuNDgpCUuAsI0jnVx3TaSagSLtAFfK3s7gn5UXnemWOc14sfdFzs98Q3BrXnsRfZVrU9YtjhLG5v4Czyq5Dj9eIJ3MfTmnsbUF1Fq0ePBM8kbAOx8WonN1JzH+pHNbN37T3CqvW2vH9EdjgXFvAv/tc+Va4z2pWXrkUvUT2x8+++VaIZmb2yhoBq6WNnU5G9SMfvO1z6cVq2JOx+LFK3mwBR8heJ+y9ep+W8W7TdRhkG2UAAdgjzuhEjjGwFrhxXhQ2HK10gLYiR/4UmXM4uItA8g+F5td6xdNZT2TtGxoF8C1dLkIFOaVn2lSsZI3aKDj5PKvmFJGIGh/JoJxz54+yTomlhL3c1wLXRQEmmn7m0j+tY8W0D5+6XE7Xs3NJBcOy+4fO8I5H+wN7m2Twm7ZJJn8ggD5CdvMZFOJNHykJZ27trWAfe0CQVztrwS48+UhPI5zTvaOOeUfcPeb7dj903e50ntebviuyFIrOkjkbQYCfF91XdTL2kSMjANfCsmYYIfc02RYDVWNTypmsc1oII+QgIPJlyCSTEbI4JRGSudw+KvwkMvNeJaLjtpIxZzW17htu05Al4nNIJBDSRSNI4vZtbVhRozmn9jkvDPu/u7j4T4D3E9MPDnEtPkVwnWdm48cTHHcRZBrtX3UX6tG3OofKh9ayJvTLBJ7XA3ymFJ+r/V0WlaXLJHO5j+S0gcdvleNepOoptX1B0888gtx2+6wtg/qC1qeKB8Lcl26qHxX4XmabU5RI1rngNvuVvrx9MM77WoZdtFSlx+bRhmu9Qkuo+FA4uVZcTIAALQP1AxvBBsnyStOJlWE55Hc3/KBupe5rGbtt+5VfUNadiwueTVDx8qGxuqp/VAY9wBNEEWqkK1rEEsM7Wgbgfghbf/Td1fP091KzFdlvYx54B5/wvNum6r60EbxNurlxBWl/TTUJotbxpmSe4uHhKzqa+q3TvVuDn4EUrMhrnSADg+VbsTL3gAkdvC8w/TfWYXYEEU+Q48Utiw+qMPDYwR5Bea4N91y5TlbY+2jtkF8EJUOB8qu6TnT5gbIP2OF/Kn4m0LJU8WcNI4NobJRAeBSMDxaXA43VJJziPKO54A7qNz8xsLCC6qHP2SBXImc0cEBQWoZjo2uc6Sr7AKF1TrFsDnRbiQOBYr+VRtZ65mY9zAXHafHalNVItGr6l6LS8F4s2SFVcrqloLo5yXRngGqKruZ19LMHh21zG8c8FV7J1aPJn9Zsnc8jsFjfbSRYdZ1CExmWCQ1+5Zp1r1E2TEfvyGtomyeFPajqbYsZ4L+S358LEOv+pG+o6FxJAN9uFjn8a4fXQZ0js6NzcgO/3AbtbpoJOVpbCHVQHYLy3pOU6eQU8gX3+AvRf09y5srSGhkxLmgUD5Xj/qxd2i8rQtMxJbGyVo45+4UtLBMWNIoAd/uq7pj8+OUuDbJ7KxDMndEKYOO9jleZXpF8NnJ3EgtqlbNKlkMHtBNUqvjSEgmSwTyOO6nNJyXNidtcascJxGcczJB/9tpd9vspPEeWtaXgguHYqI09nrASg0BX5UpK4eH0aX3D5o4nk3ABgaPm1EZM+2RzdvPyCjzyEj32PuU19j3g2S3/ACpoOGOkeB/uVfHZJZDjGC5zt3HC45DIoySKo/ymGRnDeQ8e0igUugyz5tzfaQdvdV3Uc5l974okHlTGa5hFRv5Nm/sq1nYxkL3NPFcJyhCZku19Pd91Cz6pFG4tG4tvj8qRz4HAHfLZrhV3IZDE8tcT8/ZXKEjiau5z9u27+6s2LPuh3Fm0kVz5CoWHkMZMHOidX2VsxcvdEBuO0jgJhKyS/wC00DyoDW5/Z6m66sccJxkTys4Dnc8cKE1TKjdGWudbQCD9inIVeWv6hZ5TO8m9vPNrzbn+ptDyXX83wvW/1m6ci1PAlyWROedpIA/7Xk/WsXNhmdE9ha3kV9l14fHLn6pvpeqZMbix7d9+2yVISZL92275sKDwopIn251tvlPJptptpvjhXxMpbUvUyGNaHmr7AqKb6uMeG2b+LUpj5MThU5AP9qWa3Gf4BBKAk+lX5WVKGejTfJ8D+FtnQbBpuoRZBY2cNrzXhZF0/L+nnbGxoDCe62HpeCYtbkwxF1USQpOTr1X0Drz3Y0UsMDaAraTytR03W4sx8ePJTD2uuy849Az6xI+GFji1odferW59PZun4wbFqLCH/wDyqwSsM22Dd+l9RZi48cbJGuFcG1b8XLdkCwsh6ZzMfJlY2KUmNw8WtN057I4gWvcQK7lYrT7L8kIsrxG0nlJRTB4smkz1jPjwsYzyvAYO5S7wyOo6yzFBLnVQPkLPupOvWwl8UMgN9r8qA6l6vx5sh7RlE+8gEdgqJrOa+aRzo5myj91X/wBKTkTet9afq2/sDXX57Uqpk9R7wRLEPi/CicvOFEOJAvm0yORE9p9wIPFEpVch7PmbgXhrXM+Qkm5cXJ9Esr72o+R0sbQGkEE/4QOnEbD6hoeVllOKhv1NqGMYS31Sz29/AWJ9TTQahkGOHMjkIB5//wBV46s1tgZkRGVjdocRfeliWfkPmzSGuoXwR5WObXD6tmjYORHf7SG+AbJW7/STKqD0ZOKsC1586fklYGt9dzXD791sX0p1Ob9a6KWTcARQK8z9OPY69d5W3405GRTXkD5vsp3FeZGN99We5VchxJTMJGuAFX+QrBiPMbGsfG4fheLl9enL2Hj3uD/37gOwCd4GS9jXgMJ58GlHiSOyG7rd8oC57DTX7QjGllE/Dlx47djTZ+yPJqI9EtabJVXnzWskLmOv+U90qPKyniQhwB4HwvuXzJ86XIndT3kN+EZr3RXTuK8J09jWRe6iWplI0OcS11n4CA6ST1vaAR9/lNcqowA4EgjuPlKsc7ddpPKMZYS5xBuu3ZTYcRU7huOwW0d7UbmbXhzW8D4UrIdsZLSKHJUPnPjb7mFvP8oOoTU24/pmmnfdj4Kq2pmRxLWRMHmz3U/nzsfbRfHm1AZzmnfXu44J+UShXc2Z8TwTKe/YKS0HXGeoIZHkhn9p82o7Ix5chxDWgD5TeLDGDOyaSWrPKuUrF+yJ/UG3g2PCr2pQSOshr+eKpO8XMhfAwxEuIKTzsydsRDI7+SVpims26nZtiljmaS13tLSF5f8Aqj0w7DzJcvGY4xXuPFAWvWeuNbuc6ei6iQK4WedRaFidQ40uNIGhzmmhXcrowvGGeLyOG24g+UV0YLS2jd9lpOu/ThmBkSMEjSQewNquZPSE7SfRl4A8hbMlTDdp21Zv/CcwRSFtgO3HtSmIelsx0o3tFePCmcXRmYhDC0OLe9pUCdL4LxktfNGXMHIPwVsPTupDB2bLMZbyAB4WYQZQgHsGwt7cKSw9bljb+53cfhTWmEei+muqhNHFNCx7HB3Eg8fwtl6WyJc+OPImyN47240vJPSXUmTjPaGn/aJ3BbD0fr2ZkSNa7IIb2HNALHKNZx6q0LW8aGEQMhLJG8A/K0np6TIywx7pyW1/krzv0jn5ETL3NlB+/lbH01q+RHj72zVwB2WVHWm+u3HiHqkjjwqd1lr+KzFfGxz3cfwkdR6hndB6Tvf7e4NFUTXMmZ7TJbiLunHusrfa5FU1jIxHTOfL7S42Sw8Aqo5efiPLgzK2u8buEPVuqPxnlwttu5AVGztXEznSBteCQhfE5lalJFIBMN7T5CYt1E+oHwncwH3D4UN/qZY0U4uLuKPhGxswTPPqRhoPkIprNHn+sLP8gplrGfthO1zeO/PZIMlhcCIpDdc2FX9fy5C30S5waf8AlRZ0RQusM5/6p0jZb/BuwqeXNkmbLu5YfH/SnuqJAJrO0ixwCoHFYC4lrO3J5XPsjbXfad0x7mSNIHc2LWkfT7UZcfW4Wva0bjzRWb4ZJkb7RxyCrbo+V+mz8WUO2kOF19+64d07HXjXqfHzgI4JDy1wrgqcwsyWVo9Nu5pNWe6qeiPjydLhkbyKHKsunuY0NFEAfPHK8HZOZPR1e4lHQveRW0DuuMEzWihZN3QR4nENBEgdff8ACMZHtABeFljWmSE0/Bnypdzwabzas+I448exrjY8Jtjttu2JoFCuOE6Zthb6kv7q4X3vHyxd8gMe13LruvsmskbibHB+xRH5O4k/P8pVj64b7uEgZjdE4OLXd/lI5MrnWB7f/Kd5JIdv+PCYzOY8EhxLvhTTiKyzI0EgmnfKiskSSmqpoFmlL5JtxBf/AAQo7JbtJZu7jwjg6rWVjBxc/mif8qPkxG7akFDwrDkBjGuIaSobM9Uvc0WLFH8J8Ug8p7GNLWcO/Cr+XHPkTl7ncDsAVaZNPDiA03YNkqOzII4Gu9oBHbjuU4DXTc4YrWxyvABPKk5sxs8ZbG7j4pVPMEvqCiT5quyXw897bZMLHccq5UA1mMSMeXxnjnus36jzpcYGTHYGSCwOOwWlZWTFLG5ocNxHAKzDqrEzHymVrC5guq8lbY5IyjNdY1KV815LbdRo9rUVHMMp25jRQ7ilYszS2ZjtkxDDf4ISX6HTNObvJHt7c91tL6c9iIhh2Sh8jA1jjxaRngwMtz42EMf2BvuovqnqCMn0sNzmOaVUW63mRztkEhJa6yb7qkrhm6LktYTjVIPseVEmHUISPa6gebCSxuqs6E7iN7b5FqXxNZOeCRAAe55SqpUho82fHThuDT3vwtU6Qys4iOWPILaNkX3Wcac7LyXNibG7ntTVrP076E6lzcqF7cbbG4/tfYJ/+lFi5et46D1Z5xojOCXMr3NHda/0/l5M0RayF7bb/kKofT7o6HT4mfqsdzXj3bHct4+60j1sXDi3sDGOI4bfdc+daYwjn5LsJofJKSNpPIVM13qeJwcGPDm+fFFK9T9VtY2Rs0ZaP220g1/CzDWtVjlElS7TRo+CVlxrCPUeoGRz2PqVhJs/Cps0YdIfTfxZJ5SuRnZDHlj5XSN8fdROXPkQP9SMUCLKFFZnva438cJxpzt8zb715PCi5c8TtIqjVFIw6nJjztbZBH/ITC15JdEwvZJzXYFQOZkvkaWvc02e57o7tUD4veQO9G1A5OeHna4cjxflTwIDqXBxnPL4ZKe7ineSoTFx3gU5vB5u1M6xL6jXBxBrgUojFne4bTRDTSw2xrq+pbFjaw21/t715UtDL6TmSNfRBBB8KFhezf7j2HjsnbJy+HaK78Lh2Troeq/p7l/6l03HK02WxgmlasSZ4BY5pLge6yv6I6s+bSXYwdRa2qtaJFqWTHk7Sxpo/C8P9M5k9L82XYsWO5240XdvjhGbkuIosBIPlBpmqvLamgBa42KTxzcNx3NaRu5PC5MXRkP+vga7YyQAXzSW3mQe4nYfKq+nzxO/3J3A3yBamcbKMjSGu9vhfoD5VICNrngdg3ul9gY0OYOSP8pvG7a3kCz8nugLyBuBJr/hKwAypw7c4A+3woueZzBdclOcl0jnVXfyE1lic9leO445U04ZSvFgu890yyPZzfcWFIvh2jc5ngqNnhc+6IvwgkVlbnOqr+OeEwex3eTnypeaKxZP5CjZwWi6JoIMznIEdtHbsoHMie8ku7XYCmZQ5wN3XwmcsQcSLrhA6ruTivd7SKKi8mDY1325oK1T45Ascgd1E5uGJdzWM7+fhBqhkun9QbS6kjNiHJYPVZzfcd1ZH6aRR4BHhNv0ZBDiDQP/ACrmRWM613omeZ/q4wdXJofKo+q9D60wPlkhefPB7LfXe0luwAnz4TSd8ZG2WFrgfFLaZxncHlnUuitVmkcRjuA+SObVYn6W1THmLZMWQ8/C9fT6XgSHiFoJPJpRcnSumTvG/Ga4DkmuSrmyM/67XnHRehs3UGepDjTB1gbS27Ww9BfSHC1ONjMqMwZQ42kdwtA0zA0nTwfRxAw9jQHKm8HKxcef1WUxzezgEefR/XU/0x9K9Bx8VjjgRMmjoW5vJpaToGFi6eGAYrA1p7gBUHE6zfAwF7mPa0UPBUnH15G2K2AfazyouascONhh1fTm4+1zwyu1jsql1N1dgsEkW6nt7EFZ3ndcSSsJik9xPa1W8/XJM2QOkJBo8DysK1T2paw7KJLZ7Bd+1V/L9drnOEbjzxfakzblu5FEJeHIke33O3fYqThCSAPaHPZR8Jjm47hEQGk/Kl3GwAaF9rSEoZt8kFClHzS/GJILqPx4UY7NeX+9913P2Vp1fEL43iEN9w4VDzGS487mONc8/CsLKclxg322iFFTSPkJDpK44SEWfcIcSeOAm2ROQy2/uJ734Sk4CWqvIb6gk5rkUo+B/Y0KcfHcpXOmM8JD+D2A+U1w9we0A0Seyx3T11ev6k4nFji0MPITqAkuIrx4+U33WaDeR3tPYGkAbnCj8rgrp61v6HZ4jypcV0gBP7f8rZpHOZmWTxVfledfpbmjC6kjYyQO3L0JlTOPpSH+6uy8b9uPL12/ly/xYtNmLS0NeCHHt8KbYBV+FBaU6EbLe3nkk+FYWHELRXP4K87G8d+TKtE1Xa5rpnucbqifCuWLqQaW7XF+34pZZDkSRkhtcqQg1jMhFsfVL9AfKNdbmudI0OeKd/wnUbtsdycByqHTmZNmY5yJ3W4UFNyZs0hbHYDTxwgHsskZO1h3C6AKIfaPcbH3SbQGDtZ+VzpA4bS3ij5Ss6CORVXZJ+ExkjHL/PclPWEO3OIvbwmmSaicB57o4EXkuD3+xMsmI0COefhSRjYTZCQlY33j4RwIaWIAEbQmUscY7WT+FKT1biB3TOWNoH5KVBk+FpBI7EJo/BbdirUvFGwv21wfCXfjxbQdo/8AtI5Vcl09u33C7HH2TKTThfAr8q0T48buK7eU2dAwEj4QfVVyNJc6rbVeaURm6a/dtAJ2/ZX840TwbH4Cj8zDgDSdnynKm1RnQ0Kc3jskzDyaaQCrFPhw7DtbXlMZ8eOMkjvSvpyIp+JtI2uBH/lA3FJPBAHlSIjY4D2oGwh5vcRzSJRwxET7ABNeVwheXEhxAUrDisdbSeyS9BrHkWTRRaRg3EfLYDCaF90m7CnHJHLVMRs28g8X2Sr422CAOeFNCHgipx3XX4S/pua0dq7p1NAxoBBPKTZbo3En9vClXCdFzPxwE2zHOaA2Pg1/BTsksoDz8phlyHdtP9zqtOGisrKaG25o+OCqprMWLNc7X+48baVhzx/uEA8DmlWdWaI9z23fdUSt5MkkQLR3aRSLjZomJjJ7D58ptq0z3gyni+KCisad7JAVSU1lPBb+7sgxiRI3cLF90yfM4x7q/clMWVznNvtXCz24/wDK8L7T7GgUQOf+05hvdzdnsPCbYzTI1jt1cWlw8i3D+1eZXZz0sPSeWMPqDEkAr3gFeocOJ2dpcGQxw9tdx3XkzAlLZ4JGii1wK9WdG5T5+mceZw52Ary/2Y9jp/PeZcTeDFkNO0htFTsUeQ1gDQ08d1D4GaS7aYm8Cz91Y8dkb4mvDSLHa14/Pb1Z8f/Z', '晨光', '2019-07-08 23:06:48', '2019-07-08 23:06:48', '1', '1');
INSERT INTO `kt_admin` VALUES ('2', 'test', '974cPpmJtSZhE2FubU5igrhvtDIPa5WL9G76mUi6V-opybM', '', 'test用户', '2019-11-08 11:38:49', '2019-11-08 11:38:49', '2', '1');

-- ----------------------------
-- Table structure for kt_admin_role
-- ----------------------------
DROP TABLE IF EXISTS `kt_admin_role`;
CREATE TABLE `kt_admin_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) DEFAULT NULL,
  `menu_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='管理员角色';

-- ----------------------------
-- Records of kt_admin_role
-- ----------------------------
INSERT INTO `kt_admin_role` VALUES ('1', '超级管理员', '1,2,8,3,4,5,6,9,10,11,12,14,15,16', '2019-11-08 22:04:46', '2019-11-08 22:04:46', '');
INSERT INTO `kt_admin_role` VALUES ('2', '普通管理员', null, '2019-11-08 11:37:59', '2019-11-08 11:37:59', '');

-- ----------------------------
-- Table structure for kt_article
-- ----------------------------
DROP TABLE IF EXISTS `kt_article`;
CREATE TABLE `kt_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '标题',
  `desc` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'SEO简介',
  `content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '内容',
  `article_cate_id` int(11) DEFAULT NULL COMMENT '文章分类id',
  `add_user_id` int(11) DEFAULT NULL COMMENT '添加文章用户id',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `is_show` enum('yes','no') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'yes' COMMENT '是否显示',
  `is_top` tinyint(4) DEFAULT '0' COMMENT '是否置顶  0-不置顶  1-置顶',
  `img_thumb` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '缩略图',
  `arthur` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '作者',
  `source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '来源',
  `tags` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '标签',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'seo关键词',
  `delete_time` datetime DEFAULT '0000-01-01 00:00:00' COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='文章表';

-- ----------------------------
-- Records of kt_article
-- ----------------------------

-- ----------------------------
-- Table structure for kt_article_cate
-- ----------------------------
DROP TABLE IF EXISTS `kt_article_cate`;
CREATE TABLE `kt_article_cate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pid` int(11) DEFAULT '0' COMMENT '父级id',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `level` int(11) DEFAULT '1',
  `is_show` tinyint(4) DEFAULT '1' COMMENT '1 - 是  2-否 显示',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '图标',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='文章栏目表';

-- ----------------------------
-- Records of kt_article_cate
-- ----------------------------

-- ----------------------------
-- Table structure for kt_article_tags
-- ----------------------------
DROP TABLE IF EXISTS `kt_article_tags`;
CREATE TABLE `kt_article_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `num` int(11) DEFAULT '0' COMMENT '文章数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='文章标签';

-- ----------------------------
-- Records of kt_article_tags
-- ----------------------------
INSERT INTO `kt_article_tags` VALUES ('1', '天地', '2019-08-15 20:44:28', '2019-08-15 20:44:28', '10');
INSERT INTO `kt_article_tags` VALUES ('2', '无极', '2019-08-15 20:44:28', '2019-08-15 20:44:28', '1');
INSERT INTO `kt_article_tags` VALUES ('3', '123', '2019-08-15 12:21:39', '2019-08-15 12:21:39', '0');
INSERT INTO `kt_article_tags` VALUES ('4', '测试', '2019-08-15 20:44:28', '2019-08-15 20:44:28', '9');
INSERT INTO `kt_article_tags` VALUES ('5', '测试2', '2019-08-15 20:45:18', '2019-08-15 20:45:18', '1');

-- ----------------------------
-- Table structure for kt_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `kt_auth_rule`;
CREATE TABLE `kt_auth_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pid` int(11) DEFAULT '0' COMMENT '父级id',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `level` int(11) DEFAULT '1',
  `is_show` tinyint(4) DEFAULT '1' COMMENT '1 - 是  2-否 显示',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COMMENT='权限节点';

-- ----------------------------
-- Records of kt_auth_rule
-- ----------------------------
INSERT INTO `kt_auth_rule` VALUES ('1', '系统设置', '0', 'System', 'layui-icon layui-icon-set', '1', '1', '1', null, null);
INSERT INTO `kt_auth_rule` VALUES ('2', '系统设置', '1', 'System/system', '', '0', '2', '1', null, '2019-11-09 14:13:21');
INSERT INTO `kt_auth_rule` VALUES ('3', '权限管理', '0', 'Auth', 'fa fa-group', '2', '1', '1', null, null);
INSERT INTO `kt_auth_rule` VALUES ('4', '管理员管理', '3', 'Auth/adminList', '', '0', '2', '1', null, null);
INSERT INTO `kt_auth_rule` VALUES ('5', '角色管理', '3', 'Auth/adminRoleList', '', '0', '2', '1', null, null);
INSERT INTO `kt_auth_rule` VALUES ('6', '权限节点', '3', 'Auth/authList', null, '0', '2', '1', null, null);
INSERT INTO `kt_auth_rule` VALUES ('8', '七牛云文件管理', '1', 'System/qiniuyun_file', '', '0', '1', '1', '2019-07-27 14:25:24', '2019-07-27 14:25:24');
INSERT INTO `kt_auth_rule` VALUES ('9', '内容管理', '0', 'Article', 'fa fa-list-alt', '3', '1', '1', '2019-08-14 12:02:39', '2019-08-14 12:02:39');
INSERT INTO `kt_auth_rule` VALUES ('10', '分类管理', '9', 'Article/cateList', '', '0', '1', '1', '2019-08-14 12:03:59', '2019-08-14 12:03:59');
INSERT INTO `kt_auth_rule` VALUES ('11', '文章管理', '9', 'Article/articleList', '', '0', '1', '1', '2019-08-14 12:12:36', '2019-08-14 12:12:36');
INSERT INTO `kt_auth_rule` VALUES ('12', '回收站', '9', 'Article/articleDeleteList', '', '0', '1', '1', '2019-08-15 20:06:11', '2019-08-15 20:06:11');
INSERT INTO `kt_auth_rule` VALUES ('13', '导航管理', '1', 'System/navCateList', '', '0', '1', '1', '2019-08-15 21:18:00', '2019-08-15 21:18:00');
INSERT INTO `kt_auth_rule` VALUES ('14', '轮播图管理', '0', 'Carousel', 'fa fa-picture-o', '4', '1', '1', '2019-11-08 22:03:00', '2019-11-08 22:03:07');
INSERT INTO `kt_auth_rule` VALUES ('15', '图片管理', '14', 'Carousel/lst', '', '0', '1', '1', '2019-11-08 22:04:23', '2019-11-08 22:04:23');
INSERT INTO `kt_auth_rule` VALUES ('16', '分类管理', '14', 'Carousel/cateList', '', '0', '1', '1', '2019-11-08 22:04:39', '2019-11-08 22:04:39');

-- ----------------------------
-- Table structure for kt_carousel
-- ----------------------------
DROP TABLE IF EXISTS `kt_carousel`;
CREATE TABLE `kt_carousel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `carousel_cate_id` int(11) DEFAULT NULL,
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img` longtext COLLATE utf8mb4_unicode_ci,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='轮播图表';

-- ----------------------------
-- Records of kt_carousel
-- ----------------------------
INSERT INTO `kt_carousel` VALUES ('1', '2', '1', '1', '/uploads/20191109\\0ed74badf82bacc6ffa546d24c2cf7f3.jfif', '2019-11-09 11:46:40', '2019-11-09 11:55:46');

-- ----------------------------
-- Table structure for kt_carousel_cate
-- ----------------------------
DROP TABLE IF EXISTS `kt_carousel_cate`;
CREATE TABLE `kt_carousel_cate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='轮播图分类';

-- ----------------------------
-- Records of kt_carousel_cate
-- ----------------------------
INSERT INTO `kt_carousel_cate` VALUES ('2', '前端首页', '2019-11-09 11:31:13', '2019-11-09 11:31:13', '前端首页');

-- ----------------------------
-- Table structure for kt_nav
-- ----------------------------
DROP TABLE IF EXISTS `kt_nav`;
CREATE TABLE `kt_nav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pid` int(11) DEFAULT '0' COMMENT '父级id',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `level` int(11) DEFAULT '1',
  `is_show` tinyint(4) DEFAULT '1' COMMENT '1 - 是  2-否 显示',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `nav_cate_id` int(11) DEFAULT NULL COMMENT '分类id',
  `article_cate_id` int(11) DEFAULT NULL COMMENT '文章分类id',
  `target` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '打开方式',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COMMENT='前台导航';

-- ----------------------------
-- Records of kt_nav
-- ----------------------------
INSERT INTO `kt_nav` VALUES ('14', '首页', '0', null, null, '0', '1', '1', null, null, null, null, null);
INSERT INTO `kt_nav` VALUES ('15', '新闻中心', '18', '', '', '0', '1', '1', null, null, null, '9', '');
INSERT INTO `kt_nav` VALUES ('16', '联系我们', '0', null, null, '0', '1', '1', null, null, null, null, null);
INSERT INTO `kt_nav` VALUES ('17', '小程序', '0', null, null, '0', '1', '1', null, null, null, null, null);
INSERT INTO `kt_nav` VALUES ('18', '文章列表', '0', '', '', '0', '1', '1', '2019-08-18 11:41:38', '2019-08-18 11:41:38', null, null, null);

-- ----------------------------
-- Table structure for kt_nav_cate
-- ----------------------------
DROP TABLE IF EXISTS `kt_nav_cate`;
CREATE TABLE `kt_nav_cate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='前台导航分类';

-- ----------------------------
-- Records of kt_nav_cate
-- ----------------------------
INSERT INTO `kt_nav_cate` VALUES ('1', '主菜单', '主菜单', '2019-08-18 11:30:56', '2019-08-18 11:30:56');

-- ----------------------------
-- Table structure for kt_system
-- ----------------------------
DROP TABLE IF EXISTS `kt_system`;
CREATE TABLE `kt_system` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '字段名称，保存更新的时候使用',
  `value` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='系统设置表';

-- ----------------------------
-- Records of kt_system
-- ----------------------------
INSERT INTO `kt_system` VALUES ('4', 'title', '管理系统', '2019-07-27 12:40:07', '2019-11-09 14:17:47');
INSERT INTO `kt_system` VALUES ('5', 'title1', '', '2019-07-27 12:41:05', '2019-07-27 12:41:06');
INSERT INTO `kt_system` VALUES ('6', 'qiniuyun_ak', 'VCAwo8-brMWmybQxnm7Kwl40HeErxjoOIZ12ukNf', '2019-07-27 13:45:55', '2019-07-27 13:45:55');
INSERT INTO `kt_system` VALUES ('7', 'qiniuyun_sk', '4Uy__NlgWgAXx_sCFm1udOUdgMPeRftGvRgTC0Sn', '2019-07-27 13:45:55', '2019-07-27 13:45:55');
INSERT INTO `kt_system` VALUES ('8', 'qiniuyun_bucket', 'lichenguang', '2019-07-27 13:45:55', '2019-07-27 13:45:55');
INSERT INTO `kt_system` VALUES ('9', 'logo', 'http://lichenguang.qiniuyun.changtuchacha.com/1565707656.jpg', '2019-08-13 22:47:38', '2019-08-13 22:47:38');
INSERT INTO `kt_system` VALUES ('10', 'file', '', '2019-07-27 14:15:15', '2019-07-27 14:15:15');
INSERT INTO `kt_system` VALUES ('11', 'qiniuyun_domain', 'http://lichenguang.qiniuyun.changtuchacha.com', '2019-07-27 14:15:15', '2019-07-27 14:15:15');
INSERT INTO `kt_system` VALUES ('12', 'upload_type', 'localhost', '2019-08-15 12:07:48', '2019-08-15 12:07:48');
