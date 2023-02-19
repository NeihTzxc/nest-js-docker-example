import { Column, Entity, Index, JoinColumn, ManyToOne } from "typeorm";
import { SocialBiLevels } from "./SocialBiLevels";
import { SocialUsers } from "./SocialUsers";

@Index("unique_user_id_bi_level_id", ["biLevelId", "userId"], { unique: true })
@Index("user_rank_pkey", ["id"], { unique: true })
@Index("user_rank_id_key", ["id"], { unique: true })
@Entity("social_user_bi_level", { schema: "public" })
export class SocialUserBiLevel {
  @Column("bigint", { primary: true, name: "id" })
  id: string;

  @Column("timestamp without time zone", {
    name: "created_at",
    default: () => "now()",
  })
  createdAt: Date;

  @Column("timestamp without time zone", {
    name: "updated_at",
    default: () => "now()",
  })
  updatedAt: Date;

  @Column("boolean", { name: "deleted_flg", default: () => "false" })
  deletedFlg: boolean;

  @Column("bigint", { name: "bi_level_id", nullable: true, unique: true })
  biLevelId: string | null;

  @Column("bigint", { name: "user_id", nullable: true, unique: true })
  userId: string | null;

  @Column("double precision", {
    name: "bi_level",
    nullable: true,
    precision: 53,
  })
  biLevel: number | null;

  @ManyToOne(
    () => SocialBiLevels,
    (socialBiLevels) => socialBiLevels.socialUserBiLevels
  )
  @JoinColumn([{ name: "bi_level_id", referencedColumnName: "id" }])
  biLevel_2: SocialBiLevels;

  @ManyToOne(() => SocialUsers, (socialUsers) => socialUsers.socialUserBiLevels)
  @JoinColumn([{ name: "user_id", referencedColumnName: "id" }])
  user: SocialUsers;
}
