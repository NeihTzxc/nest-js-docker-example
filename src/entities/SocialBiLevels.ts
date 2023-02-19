import { Column, Entity, Index, OneToMany } from "typeorm";
import { SocialUserBiLevel } from "./SocialUserBiLevel";

@Index("rank_id_key", ["id"], { unique: true })
@Index("rank_pkey", ["id"], { unique: true })
@Entity("social_bi_levels", { schema: "public" })
export class SocialBiLevels {
  @Column("bigint", { primary: true, name: "id" })
  id: string;

  @Column("text", { name: "name", nullable: true })
  name: string | null;

  @Column("text", { name: "description", nullable: true })
  description: string | null;

  @Column("smallint", { name: "type", nullable: true })
  type: number | null;

  @Column("text", { name: "icon_uri", nullable: true })
  iconUri: string | null;

  @OneToMany(
    () => SocialUserBiLevel,
    (socialUserBiLevel) => socialUserBiLevel.biLevel_2
  )
  socialUserBiLevels: SocialUserBiLevel[];
}
