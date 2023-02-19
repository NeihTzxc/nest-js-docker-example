import { Column, Entity, Index } from "typeorm";

@Index("social_user_block_pkey", ["id"], { unique: true })
@Entity("social_user_block", { schema: "public" })
export class SocialUserBlock {
  @Column("bigint", { primary: true, name: "id" })
  id: string;

  @Column("timestamp without time zone", {
    name: "created_at",
    nullable: true,
    default: () => "now()",
  })
  createdAt: Date | null;

  @Column("timestamp without time zone", {
    name: "updated_at",
    nullable: true,
    default: () => "now()",
  })
  updatedAt: Date | null;

  @Column("boolean", {
    name: "deleted_flg",
    nullable: true,
    default: () => "false",
  })
  deletedFlg: boolean | null;

  @Column("bigint", { name: "user_id" })
  userId: string;

  @Column("bigint", { name: "target_id", nullable: true })
  targetId: string | null;
}
